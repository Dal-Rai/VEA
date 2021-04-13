module ApplicationProgressStateHelper
  extend ActiveSupport::Concern

  class_methods do

    def transition_params(event)
      event = event.to_sym
      {
        attachments_attributes: application_progress_attributes
      }[event]
    end

    def application_progress_attributes
      [
        :event,
        attachments_attributes: attachments_attributes
      ]
    end

    def attachments_attributes
      [
        :file
      ]
    end

    def expenditure_attributes
      [
        :lead_time,
        opex_costs_attributes: cost_attributes,
        capex_costs_attributes: cost_attributes,
        direct_costs_attributes: cost_attributes
      ]
    end

    def costing_attributes
      [
        :lead_time,
        cart_attributes: cart_attributes << {
          flexi_costs_attributes: flexi_attributes,
          service_prices_attributes: service_price_attributes
        },
        endpoints_attributes: [
          :id,
          endpoint_cart_attributes: endpoint_cart_attributes
        ],
        financial_attributes: financial_attributes,
        order_form_comments_attributes: comment_attributes
      ]
    end

    def cost_attributes
      %i[id name amount currency _destroy]
    end

    def cart_attributes
      %i[id mrc otc currency remarks vlan_id]
    end

    def endpoint_cart_attributes
      [
        :id,
        :mrc,
        :otc,
        flexi_costs_attributes: flexi_attributes,
        service_prices_attributes: service_price_attributes
      ]
    end

    def flexi_attributes
      %i[id mrc otc year]
    end

    def comment_attributes
      %i[id user_id message state _destroy]
    end

    def financial_attributes
      %i[id tcv gross_margin npv irr payback payback_percentage ocf ocf_percentage]
    end

    def service_price_attributes
      %i[id mrc otc service]
    end
  end

end
