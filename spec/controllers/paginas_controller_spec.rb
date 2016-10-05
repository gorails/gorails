require 'rails_helper'

RSpec.describe PaginasController, type: :controller do
  describe '#show' do
    subject { get :show, pagina: page; response.status }

    context "when page is valid," do
      let(:page) { configatron.static_pages.paginas.first }
      it         { is_expected.to eq(200) }
    end

    context "when page is not valid," do
      let(:page) { 'invalid-page' }
      it         { is_expected.to eq(404) }
    end
  end
end
