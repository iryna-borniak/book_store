import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.setupAdobeDCView();
  }

  setupAdobeDCView() {
    const adobeDCView = new AdobeDC.View({
      clientId: "9155e0c8b1be451f8f1f44b860bc319f",
      divId: "adobe-dc-view",
    });

    const pdfUrl = this.element.dataset.pdfUrl;
    const pdfFilename = this.element.dataset.pdfFilename;

    adobeDCView.previewFile(
      {
        content: { location: { url: pdfUrl } },
        metaData: { fileName: pdfFilename },
      },
      {}
    );
  }
}
