
$(document).on('turbolinks:load', function () {
    $.fn.extend({
        animateCss: function (animationName) {
            var animationEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
            this.addClass('animated ' + animationName).one(animationEnd, function () {
                $(this).removeClass('animated ' + animationName);
            });
        }
    });
    //
    // $('.tile-large').animateCss('bounceInLeft');
    // $('.tile-wide').animateCss('zoomIn');
    // $('.tile').animateCss('bounceIn');
    // $('.tickets-block').animateCss('zoomIn');
    // $('.sidebar-content').animateCss('fadeInDown');
    // $('.backlog-items').animateCss('fadeInUp');
    // $('#light.navigation_content').animateCss('bounceInLeft');

    $('#tabOne').animateCss('fadeIn');

    $("#menu-toggle").click(function (e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });

    $(".toggleNav").click(function () {
        $(".toggleNav").toggleClass("on");
        $(".navigation_content").slideToggle();
        $("#fade").slideToggle();
    });

    $(document).mouseup(function (e) {
        var container = $('.navigation_content');
        var menuBars = $(".toggleNav");
        if (!container.is(e.target) && !menuBars.is(e.target) && container.has(e.target).length === 0 && menuBars.has(e.target).length === 0) {
            if (menuBars.hasClass('on')) {
                menuBars.trigger('click');
            }
        }
    });

    $('[data-toggle=offcanvas]').click(function () {
        $('.row-offcanvas').toggleClass('active');
    });

    // show the alert
    setTimeout(function () {
        $(".alert").delay(1000).fadeOut(2000);
    }, 2000);


    /* Login Validation */

    $('#new_user').validate({
        rules: {
            email: {
                required: true,
                email: true
            },
            password: "required"

        },
        messages: {
            email: "Please enter a valid email address",
            password: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long"
            }
        }
    });
    $(".login-btn").click(function () {
        $('#new_user').valid();
    });

    /* ---- SignUp Div Transition ------ */

    var current_fs, next_fs, previous_fs; //fieldsets
    var left, opacity, scale; //fieldset properties which we will animate
    var animating; //flag to prevent quick multi-click glitches

    $(".next").click(function () {
        var signUpForm = $('#signUpForm').valid();  //Boolean value

        if (signUpForm) {  // Proceed only on Valid form input
            if (animating) return false;
            animating = true;
            current_fs = $(this).parent();
            next_fs = $(this).parent().next();

            //activate next step on progressbar using the index of next_fs
            $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

            //show the next fieldset
            next_fs.show();

            //hide the current fieldset with style
            current_fs.animate({opacity: 0}, {
                step: function (now, mx) {
                    //as the opacity of current_fs reduces to 0 - stored in "now"
                    //1. scale current_fs down to 80%
                    scale = 1 - (1 - now) * 0.2;
                    //2. bring next_fs from the right(50%)
                    left = (now * 50) + "%";
                    //3. increase opacity of next_fs to 1 as it moves in
                    opacity = 1 - now;
                    current_fs.css({
                        'transform': 'scale(' + scale + ')',
                        'position': 'absolute'
                    });
                    next_fs.css({'left': left, 'opacity': opacity});
                },
                duration: 800,
                complete: function () {
                    current_fs.hide();
                    animating = false;
                },
                //this comes from the custom easing plugin
                easing: 'easeInOutBack'
            });
        }
    });

    $(".previous").click(function (e) {
        if (animating) return false;
        animating = true;

        current_fs = $(this).parent();
        previous_fs = $(this).parent().prev();

        //de-activate current step on progressbar
        $("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");

        //show the previous fieldset
        previous_fs.show();
        //hide the current fieldset with style
        current_fs.animate({opacity: 0}, {
            step: function (now, mx) {
                //as the opacity of current_fs reduces to 0 - stored in "now"
                //1. scale previous_fs from 80% to 100%
                scale = 0.8 + (1 - now) * 0.2;
                //2. take current_fs to the right(50%) - from 0%
                left = ((1 - now) * 50) + "%";
                //3. increase opacity of previous_fs to 1 as it moves in
                opacity = 1 - now;
                current_fs.css({'left': left});
                previous_fs.css({'transform': 'scale(' + scale + ')', 'opacity': opacity});
            },
            duration: 800,
            complete: function () {
                current_fs.hide();
                animating = false;
            },
            //this comes from the custom easing plugin
            easing: 'easeInOutBack'
        });
    });


    /* ---- SignUp Validation------ */
    $('#signUpForm').validate({
        rules: {
            useremail: {
                required: true,
                email: true
            },
            password: "required",
            confirmpassword: "required",
            salutation: "required",
            gender: "required",
            firstname: "required",
            lastname: "required",
            designation: "required",
            phoneno: "required",
            companytype: "required",
            companyname: "required",
            companyemail: "required",
            companyphone: "required",
            companywebsite: "required"
        },
        messages: {
            useremail: "Please enter a valid email address",
            userpassword: {
                required: "Please provide a password",
                minlength: "Your password must be at least 5 characters long"
            },
            confirmpassword: "Please confirm your password",
            salutation: "Please select your Salutation",
            gender: "Please select your Gender",
            firstname: "Please enter your First Name",
            lastname: "Please enter your Last Name",
            designation: "Please enter your Designation",
            phoneno: "Please enter your Phone Number",
            companytype: "Provide your Company Type",
            companyname: "Provide your Company Name",
            companyemail: "Provide your Company E-mail",
            companyphone: "Provide your Company Phone Number",
            companywebsite: "Provide your Company Website"
        }
    });

    $(".submit").click(function () {
        $('#signUpForm').valid();
    });


    /* ---- SignUp Validation------ */
    $('.edit_user').validate({
        rules: {
            salutation: "required",
            gender: "required",
            firstname: "required",
            lastname: "required",
            designation: "required",
            phone: "required",
            email: {
                required: true,
                email: true
            }
        },
        messages: {
            salutation: "Please select your Salutation",
            gender: "Please select your Gender",
            firstname: "Please enter your First Name",
            lastname: "Please enter your Last Name",
            designation: "Please enter your Designation",
            phone: "Please enter your Phone Number",
            email: "Please enter a valid email address"
        }
    });

    /* ---- Calender Date Selection------ */
    var date = new Date();
    var today = new Date(date.getFullYear(), date.getMonth(), date.getDate()).format("mmmm dd, yyyy");
    var end = new Date(date.getFullYear(), date.getMonth(), date.getDate());

    var datePicker = $('#datepicker');
    datePicker.datepicker({
        format: "mmmm dd, yyyy",
        todayHighlight: true,
        startDate: today,
        endDate: end,
        autoclose: true
    });

    datePicker.datepicker('setDate', today).val(today);
    // console.log(today);
    $('#preview_date').text(datePicker.val());


    datePicker.on('change', function () {
        var dateThis = $(this).val();

        $('#preview_date').text(dateThis);
        var ticket_type = $('.index-ticket-view').attr('id');
        var user = $('#users').val();
        if (user == 0) {
            var company = $('#company').find("option:selected").val();
        }
        else {
            var company = $('#company').val();
        }
        company = company === undefined ? "" : company;
        filter_ticket(ticket_type, dateThis, company, "pickadate");
    });

    $('#company').on('change', function () {
        var company = $(this).find("option:selected").val();
        $('#preview_date').text(dateThis);
        var ticket_type = $('.index-ticket-view').attr('id');
        var dateThis = $("#datepicker").val();
        // company = company === undefined ? "" : company
        filter_ticket(ticket_type, dateThis, company, "pickadate");
    });

    $('#prevDate').on('click', function () {
        var date1 = datePicker.val();
        var date = new Date(Date.parse(date1));
        date.setDate(date.getDate() - 1);
        var newDate = date.toDateString();
        newDate = new Date(Date.parse(newDate)).format("mmmm dd, yyyy");

        datePicker.datepicker('setDate', newDate).val(newDate);
        $('#preview_date').text(newDate);
        datePicker.trigger("change")
    });
    $('#nextDate').on('click', function () {
        var date1 = datePicker.val();
        var date = new Date(Date.parse(date1));
        date.setDate(date.getDate() + 1);
        var newDate = date.toDateString();
        newDate = new Date(Date.parse(newDate)).format("mmmm dd, yyyy");

        datePicker.datepicker('setDate', newDate).val(newDate);
        $('#preview_date').text(newDate);
        datePicker.trigger("change")
    });

    var filter_ticket = function (ticket_type, dateThis, company, date_flag) {
        $.ajax({
            url: '/ticketings/date_filter',
            type: 'GET',
            data: {ticket_type: ticket_type, pickDate: dateThis, company: company, date_flag: date_flag},
            success: function (res) {
                $('.index-ticket-view').html(res);
            }
        });
    };

    /* --- Profile Image Update----- */
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('.img-preview').attr('src', e.target.result);
            };
            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#profileImage").change(function () {
        readURL(this);
    });

    /* ------- Submit button ------*/

    $('.filter-checkbox').on('click', function () {
        $(".backlog-filter input:checkbox[class='" + $(this).attr("class") + "']").not(this).prop("checked", false);
        var user = $('#users').val();
        if (user == 0) {
            var company = $('#company').find("option:selected").val();
        }
        else {
            var company = $('#company').val();
        }
        var priority = $('.priority:checked').val();
        var ticket_type = $('.ticket-type:checked').val();
        ticket_type = ticket_type === undefined ? "" : ticket_type;
        priority = priority === undefined ? "" : priority;
        company = company === undefined ? "" : company;
        backlog_filter(ticket_type, priority, company);
    });

    $('#company').on('change', function () {
        var priority = $('.priority:checked').val();
        var ticket_type = $('.ticket-type:checked').val();
        ticket_type = ticket_type === undefined ? "" : ticket_type;
        priority = priority === undefined ? "" : priority;
        var company = $(this).find("option:selected").val();
        backlog_product_detail(company);
        backlog_filter(ticket_type, priority, company);
    });


    var backlog_filter = function (ticket_type, priority, company) {
        $.ajax({
            url: '/ticketings/filter',
            type: 'GET',
            data: {ticket_type: ticket_type, priority: priority, company: company},
            success: function (res) {
                $('.backlog-items').html(res);
            }
        });
    };

    function backlog_product_detail(company){
        $.ajax({
            url: '/ticketings/company_details',
            type: 'GET',
            data: {company: company},
            success: function (res) {
                $('.backlog-remarks').html(res  );

            }
        });
    };


    // Profile Password Confirm Modal
    $('.update-btn').click(function () {
        $('#passwordConfirm').modal('show');
    });
    $('.confirm-pwd[type="submit"]').click(function (e) {
        e.preventDefault();
        //Profile Form validation
        var profileForm = $('.edit_user');
        if (profileForm.valid()) {
            profileForm.submit();
            $('#passwordConfirm').modal('hide'); // Hide modal after submit.
        }
    });

    //Change password section
    $('.change-pwd-section').hide(); // Hide Section initially
    $('#user_password,#user_password_confirmation').val('');  // Clear password fields

    $('.change-password').change('click', function () {
        if (this.checked) {
            $('.change-pwd-section').show();
        }
        else {
            $('.change-pwd-section').hide();
            $('#user_password,#user_password_confirmation').val('')
        }
    });


    // Download Report Modal
    $('.download-report').click(function () {
        $('#downloadReport').modal('show');
    });


    var currentYear = date.getFullYear(); //date from above variable
    var monthArray = new Array();
    monthArray[0] = "January";
    monthArray[1] = "February";
    monthArray[2] = "March";
    monthArray[3] = "April";
    monthArray[4] = "May";
    monthArray[5] = "June";
    monthArray[6] = "July";
    monthArray[7] = "August";
    monthArray[8] = "September";
    monthArray[9] = "October";
    monthArray[10] = "November";
    monthArray[11] = "December";
    for (m = 0; m <= 11; m++) {
        var optnMonth = document.createElement("OPTION");
        optnMonth.text = monthArray[m];
        // server side month start from one
        optnMonth.value = (m + 1);

        // if june selected
        // if ( m == 5) {
        //optn.selected = true;
        // }

        document.getElementById('month').options.add(optnMonth);
    }
    for (y = 2015; y <= currentYear; y++) {
        var optnYear = document.createElement("OPTION");
        optnYear.text = y;
        optnYear.value = y;

        // if year is 2015 selected
        //if (y == 2015) {
        // optn.selected = true;
        // }

        document.getElementById('year').options.add(optnYear);
    }

    // Validate Report Selection

    var reportBtn = $('#downloadReport .download');

    reportBtn.prop('disabled', true); //Initial state disabled

    $('#downloadReport select').on('change', function () {
        var monthOption = $('#month').find('option:selected').val();
        var yearOption = $('#year').find('option:selected').val();
        var productOption = $('#product').find('option:selected').val();

        if ((monthOption && yearOption && productOption) === '') {
            reportBtn.prop('disabled', true);
        }
        else {
            reportBtn.prop('disabled', false);
        }
    });

    $('.chosen-select').on('change', function (e) {
        var id = $(this).val();
        var url = '/company/' + id + '/edit';
        $.ajax({
            url: url,
            type: 'GET',
            data: {id: id}
        });
        window.location.replace(url);
    });

    // Toggle Grid & List View for Tickets
    $('#switchView').click(function(){
        $('.ticket-gridview, .ticket-listview').toggle();
        $(this).find('i').toggleClass('fa-th fa-th-list');
    });

});

$(document).on('shown.bs.modal', function () { //Dom Ready

    $("#ticketEffort").inputmask({"mask": "99.9"});

    $('.nav-tabs li').click(function () {
        $('#tabOne,#tabTwo,#tabThree,#tabFour').animateCss('fadeIn');
    });

    // Change Tab on Next button
    $('.ticket-next').click(function () {
        $('.ticket-modal a[href="#tabTwo"]').tab('show');
    });

    // Disable inputs

    $('#radioBug,#radioFreeBug,#radioEnhance,#radioIssue').click(function () {
        //  $('#ticketPrice').prop('disabled', false);
        $('#ticketEffort').prop('disabled', false);
    });

    $('#radioNoIssue').click(function () {
        //  $('#ticketPrice').prop('disabled', true).val('');
        $('#ticketEffort').prop('disabled', true).val('');
    });

    // Ticket Pricing & Type selection to make button disable
    function submitState(el) {

        var form = $(el),
            requiredInputs = form.find('input:required'),
            submitBtn = form.find('#respondBtn');

        submitBtn.attr('disabled', 'disabled');
        requiredInputs.on('keyup click', function () {
            form.data('empty', 'false');

            if ($('.ticket-radio-no-issue').is(':checked')) {
                form.data('empty', 'false');
            }
            else {
                requiredInputs.each(function () {
                    if ($(this).val() === '' || !$('.ticket-radio').is(':checked')) {
                        form.data('empty', 'true');
                    }
                });
            }
            if (form.data('empty') === 'true') {
                submitBtn.attr('disabled', 'disabled');
            } else {
                submitBtn.removeAttr('disabled');
            }
        });
    }

    // apply to each form element individually

    submitState('.edit_ticketing');

    $('#respondBtn, #approveBtn, #doneBtn').on('click', function (e) {
        e.preventDefault();
        //$('#respondBtn').prop('disabled', false);
        $('.ticket-title').prop('disabled', false); //Disable while passing value
    });

    $('.cancel-btn').click(function () {
        $('#respondBtn').attr('disabled', false);
        $('.ticket-title').prop('disabled', true);
    });

    // Warning Message Modal
    $('.closefirstmodal').click(function () {
        $('#Warning').modal('show');
    });
    $('.confirmclosed[type="submit"]').click(function () {
        $('.edit_ticketing').submit();
        $('#Warning').modal('hide');
        $('#ticketModal').modal('hide');
    });

    // Open Image Lightbox to Preview
    $('.open-lightbox').on('click', function (e) {
        e.preventDefault();
        var image = $(this).attr('href');
        $('html').addClass('no-scroll');
        $('body').append('<div class="lightbox-opened"><img src="' + image + '"></div>');
    });

    // Close Image Lightbox
    $('body').on('click', '.lightbox-opened', function () {
        $('html').removeClass('no-scroll');
        $('.lightbox-opened').remove();
    });

    // Custom Focus & Select Function
    jQuery.fn.focusAndSelect = function () {
        return this.each(function () {
            $(this).focus();
            if (this.setSelectionRange) {
                var len = $(this).val().length * 2;
                this.setSelectionRange(0, len);
            } else {
                $(this).val($(this).val());
            }
            //  this.scrollTop = 999999;
        });
    };

    // Edit Title
    $('#editBtnTitle').off('click').on('click', function (e) { //Off function to prevent event firing multiple times
        e.preventDefault();
        $(this).find('i').toggleClass('fa-check fa-pencil');
        $(this).toggleClass('done');
        var titleInput = $('.ticket-title');
        titleInput.toggleClass('edit');
        if (titleInput.hasClass('edit')) {
            titleInput.prop('disabled', false);
            titleInput.focusAndSelect();
        }
        else {
            titleInput.prop('disabled', true);
        }
    });

    $('.ticket-title').on('keypress, keyup', function () {
        if (this.value.length > 0) {
            this.style.width = ((this.value.length + 1) * 11) + 'px';
        } else {
            this.style.width = ((this.getAttribute('placeholder').length + 1) * 11) + 'px';
        }
    })
    .attr('size', function () {
        return this.value.length;
    });

    // Chat Button Disable
    var chatField = $('#chat-field');
    $('.chat-controls-btn').prop('disabled', true);
    chatField.keyup(function(){
      $('.chat-controls-btn').prop('disabled', this.value.length >= 2 ? false : true);

    });
    chatField.keydown(function (e) {
        if (this.value.length < 2 && e.which === 32) {
            e.preventDefault();
        }
    });

});
