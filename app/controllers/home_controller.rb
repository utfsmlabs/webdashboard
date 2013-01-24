class HomeController < ApplicationController
  def index
  end

  def lpa
  end

  def lds
  end

  def sda
  end

  def ninja
  end

  def tasks
    require 'open-uri'
    base_url = "http://code.inf.santiago.usm.cl/projects/primos/issues"
    code_api = "" #API KEY DASHBOARD USER
    json_end = ".json?key="+code_api+"&limit=11"
    incluir_changesets = "&include=changesets,journals"
    @lista = JSON.parse(open(base_url+json_end).read)['issues']
    @lista.each do |issue|
      sub_url = "/"+issue['id'].to_s
      @extras = JSON.parse(open(base_url+sub_url+json_end+incluir_changesets).read)['issue']['journals']
      issue['journals'] = @extras
    end
  end
end
