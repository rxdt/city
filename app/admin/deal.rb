ActiveAdmin.register Deal do
  permit_params :company_name,
                :blurb,
                :description,
                :round,
                :raise,
                :commitment,
                :min_investment,
                :security_type,
                :conversion_discount,
                :valuation_cap,
                :warranty_coverage,
                :note_term
end
