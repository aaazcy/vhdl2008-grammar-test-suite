-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SNN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Negative
-- Test Focus: SNN: no alternative at all — `case? sel is end case?;` end case? directly after is, no when branch
-- Expected Result: Triggers syntax error: at least one choice required in case statement
-- Dependencies: None
-- =============================================================
entity mcs_snn6_ent is port(sel:in bit_vector(1 downto 0); y:out integer); end entity;
architecture bh of mcs_snn6_ent is
begin
  process(sel) begin
    case? sel is end case?;
  end process;
end architecture bh;
