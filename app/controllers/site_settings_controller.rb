class SiteSettingsController < ApplicationController
  def edit
    @site_setting = resource
  end

  def update
    @site_setting = resource

    if @site_setting.update(site_setting_params)
      redirect_to edit_site_setting_path, notice: "Site settings were successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def revert
    @site_setting = resource

    if SiteSetting.restore_defaults!
      redirect_to edit_site_setting_path, notice: "Site settings were successfully reverted."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def resource
    SiteSetting.current
  end

  def site_setting_params
    params.require(:site_setting).permit(:title, :favicon)
  end
end
