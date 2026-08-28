-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SNN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing expression — `case? is ... end case?;` case? is directly followed by is, no selection expression
-- Expected Result: Triggers syntax error: missing expression after 'case?'
-- Dependencies: None
-- =============================================================
entity mcs_snn4_ent is port(y:out integer); end entity;
architecture bh of mcs_snn4_ent is
begin
  process is
  begin
    case? is
      when "00" => y <= 0;
    end case?;
    wait;
  end process;
end architecture bh;
