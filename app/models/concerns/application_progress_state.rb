module ApplicationProgressState
  extend ActiveSupport::Concern

  include ApplicationProgressStateHelper

  PROGRESS_STATE = {
    applied: 1,
    offer_received: 2,
    sop_submission: 3,
    coe_received: 4,
    enrolled: 5,
    completed: 6,
    rejected: 0
  }

  included do
    include AASM

    enum state: PROGRESS_STATE

    aasm whiny_transitions: false, column: :state, enum: true do
      state :applied, initial: true
      state :offer_received
      state :sop_submission
      state :coe_received
      state :enrolled
      state :completed
      state :rejected

      # before_all_events :assign_params
      after_all_events :transition_callback

      event :offering do
        transitions from: :applied, to: :offer_received
      end

      event :sop_submitting do
        transitions from: :offer_received, to: :sop_submission
      end

      event :sop_verifying do
        transitions from: :sop_submission, to: :coe_received
      end

      event :enrolling do
        transitions from: :coe_received, to: :enrolled
      end

      event :completing do
        transitions from: :enrolled, to: :completed
      end

      event :rejecting do
        transitions from: :applied, to: :rejected
        transitions from: :sop_submission, to: :rejected
      end
    end

    def event(user, params)
      event = params.delete(:event)
      send("#{event}!", user, params)
    end

    ApplicationProgress.aasm.events.map(&:name).each do |event|
      define_method "#{event}?" do
        aasm.current_event.eql? "#{event}!".to_sym
      end
    end

  end

  def transition_callback(*args)
    user, _ = args
    callback = "after_#{aasm.current_event}"
    send(callback, *args) if respond_to?(callback)

    self.user.update(enroll: true) if self.enrolled?
  end

  # def assign_params(user, params)
  #   update_attributes(params)
  # end

  # def states
  #   site_states = PRODUCTION_STATES.keys
  #   current = site_states.index(aasm.current_state)
  #   site_states.each_with_index.map { |k, i| [k, i <= current] }.to_h
  # end
  #
  # def actions
  #   aasm.events.map(&:name)
  # end

  # def action
  #   actions.last
  # end

  # def estimated_dates
  #   site_dates.each_with_object(HashWithIndifferentAccess.new) { |row, hash| hash[row.action] = row.estimated_date }
  # end
  #
  # def parent
  #   selected? ? 'order' : 'quote'
  # end
  #
  # def humanize_state
  #   cpe_installation? ? 'rfs' : state
  # end
  #
  # def update_assignee
  #   owner =
  #     case state.to_sym
  #     when :awaiting_customer, :awaiting_order
  #       'customer'
  #     when :awaiting_presales
  #       'presales'
  #     else
  #       'sales'
  #     end
  #   self.update!(assignee: owner)
  # end

end
