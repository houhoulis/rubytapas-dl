# encoding: utf-8

require "rubytapas-dl/download_progress_notifier"
require "stringio"

describe DownloadProgressNotifier do
  let(:target) { "/tmp/download.txt" }
  let(:listener) { StringIO.new }
  let(:notifier) { DownloadProgressNotifier.new(target, listener) }

  it "notifies that th download has started" do
    notifier.download_started

    expect(listener.string).to eq("\n")
  end

  it "notifies that the download is progressing" do
    notifier.progress(20)

    expect(listener.string).to eq("\rDownloading download.txt … 20%")
  end

  it "notifies that the download has finished" do
    notifier.download_finished

    expect(listener.string).to eq("\rDownloading download.txt … 100%")
  end
end
