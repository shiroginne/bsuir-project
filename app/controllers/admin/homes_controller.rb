class Admin::HomesController < Admin::AdminBaseController
  authorize_resource :class => false
end
