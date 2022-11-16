class ApiUrl {
  static const String apiMainPath = "https://lebechproperty.com/admin/api/";

  /// Buyer
  static const String homeScreenApi = apiMainPath + "customer/index";
  static const String loginApi = apiMainPath + "customer/login";
  static const String registerApi = apiMainPath + "customer/register";
  static const String propertyDetailsApi = apiMainPath + "customer/property_detail";

  static const String projectListApi = apiMainPath + "customer/project_list";
  static const String projectDetailsApi = apiMainPath + "customer/project_detail";

  static const String getCategoryWisePropertyApi = apiMainPath + "customer/category_property";
  static const String changeCityApi = apiMainPath + "customer/change_city";
  static const String searchResultApi = apiMainPath + "customer/search_result";
  static const String directSearchApi = apiMainPath + "customer/direct_search";
  static const String fetchProjectApi = apiMainPath + "customer/project_fetch";
  static const String getSubCategoryWisePropertyApi = apiMainPath + "customer/sub_category_property";

  static const String getVisitDetailsApi = apiMainPath + "customer/book_detail";
  static const String saveVisitApi = apiMainPath + "customer/save_visit";
  static const String visitListApi = apiMainPath + "customer/visit_list";
  static const String buyContactApi = apiMainPath + "customer/buy_contact";
  static const String contactListApi = apiMainPath + "customer/contact_list";

  /// Seller
  static const String sellerLoginApi = apiMainPath + "seller/login";
  static const String sellerRegisterApi = apiMainPath + "seller/register";
  static const String basicDetailsApi = apiMainPath + "basic_detail";
  static const String createPropertyDetailsApi = apiMainPath + "seller/save_propert";
  static const String getSellerAllPropertyApi = apiMainPath + "seller/list_property";
  static const String addPropertyImagesApi = apiMainPath + "seller/add_image";
  static const String getSellerPropertyImagesApi = apiMainPath + "seller/property_image_list";
  static const String changeSellerPropertyStatusApi = apiMainPath + "seller/change_property_status";
  static const String addSellerPropertyImagesApi = apiMainPath + "seller/add_image";
  static const String deleteSellerPropertyImageApi = apiMainPath + "seller/delete_property_image";
  static const String getSellerPropertyYoutubeLinkApi = apiMainPath + "seller/property_youtube";
  static const String addSellerPropertyYoutubeLinkApi = apiMainPath + "seller/upload_property_youtube";
  static const String deleteSellerPropertyYoutubeLinkApi = apiMainPath + "seller/delete_property_youtube";
  static const String sellerProjectVideoApi = apiMainPath + "seller/project_video";
  static const String sellerAddProjectVideoApi = apiMainPath + "seller/upload_video";
  static const String sellerUploadPropertyVideoApi = apiMainPath + "seller/upload_property_video";
  static const String sellerGetPropertyVideoApi = apiMainPath + "seller/fetch_property_video";


  /// Builder
  static const String builderLoginApi = apiMainPath + "builder/login";
  static const String builderRegisterApi = apiMainPath + "builder/register";
  static const String getBuilderAllPropertyApi = apiMainPath + "builder/list_property";
  static const String getBuilderAllProjectsApi = apiMainPath + "builder/project_list";
  static const String createBuilderPropertyDetailsApi = apiMainPath + "builder/save_propert";
  static const String addProjectImagesApi = apiMainPath + "builder/upload_project_image";
  static const String getProjectImagesApi = apiMainPath + "builder/project_image";
  static const String addBuilderProjectApi = apiMainPath + "builder/create_project";
  static const String changeProjectStatusApi = apiMainPath + "builder/change_project_status";
  static const String addOtherProjectApi = apiMainPath + "builder/add_other_projects";
  static const String getOtherProjectApi = apiMainPath + "builder/other_project_list";
  static const String changePropertyStatusApi = apiMainPath + "builder/change_property_status";
  static const String getPropertyImageListApi = apiMainPath + "builder/property_image_list";
  static const String addBuilderPropertyImagesApi = apiMainPath + "builder/add_image";
  static const String deleteBuilderProjectImageApi = apiMainPath + "builder/delete_project_image";
  static const String getBuilderOtherProjectImageApi = apiMainPath + "builder/other_project_list";
  static const String deleteBuilderOtherProjectApi = apiMainPath + "builder/delete_other_project";
  static const String projectLogoApi = apiMainPath + "builder/project_logo";
  static const String addProjectLogoApi = apiMainPath + "builder/upload_logo";
  static const String projectVideoApi = apiMainPath + "builder/project_video";
  static const String addProjectVideoApi = apiMainPath + "builder/upload_video";
  static const String addPropertyYoutubeLinkApi = apiMainPath + "builder/upload_property_youtube";
  static const String getPropertyYoutubeLinkApi = apiMainPath + "builder/property_youtube";
  static const String deletePropertyYoutubeLinkApi = apiMainPath + "builder/delete_property_youtube";
  static const String deletePropertyImageApi = apiMainPath + "builder/delete_property_image";
  static const String uploadProjectBrochureApi = apiMainPath + "builder/upload_brochure";
  static const String getProjectBrochureApi = apiMainPath + "builder/project_brochure";
  static const String deleteProjectBrochureApi = apiMainPath + "builder/delete_project_brochure";
  static const String getProjectPriceRangeApi = apiMainPath + "builder/project_price_list";
  static const String addProjectPriceRangeApi = apiMainPath + "builder/add_price";

  static const String getProjectNearByApi = apiMainPath + "builder/project_near_by_list";
  static const String addProjectNearByApi = apiMainPath + "builder/add_near_by";

  static const String getProjectYtLinkApi = apiMainPath + "builder/project_youtube_video_list";
  static const String addProjectYtLinkApi = apiMainPath + "builder/add_youtube_video";

  static const String builderUploadPropertyVideoApi = apiMainPath + "builder/upload_property_video";
  static const String builderGetPropertyVideoApi = apiMainPath + "builder/fetch_property_video";



  /// Broker
  static const String brokerLoginApi = apiMainPath + "agent/login";
  static const String brokerRegisterApi = apiMainPath + "agent/register";
  static const String getBrokerAllPropertyApi = apiMainPath + "agent/list_property";
  static const String addBrokerPropertyImagesApi = apiMainPath + "agent/add_image";
  static const String createBrokerPropertyDetailsApi = apiMainPath + "agent/save_propert";
  static const String changeBrokerPropertyStatusApi = apiMainPath + "agent/change_property_status";
  static const String getBrokerPropertyImageListApi = apiMainPath + "agent/property_image_list";
  static const String deleteBrokerPropertyImageApi = apiMainPath + "agent/delete_property_image";

  static const String addBrokerPropertyYoutubeLinkApi = apiMainPath + "agent/upload_property_youtube";
  static const String getBrokerPropertyYoutubeLinkApi = apiMainPath + "agent/property_youtube";
  static const String deleteBrokerPropertyYoutubeLinkApi = apiMainPath + "agent/delete_property_youtube";

  static const String brokerUploadPropertyVideoApi = apiMainPath + "agent/upload_property_video";
  static const String brokerGetPropertyVideoApi = apiMainPath + "agent/fetch_property_video";
}