-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: SMN_MCS_INCOMPLETE
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Negative
-- Test Focus: SMN: matching case incomplete coverage — case? 2-bit expression, only when "00" and when "01" two branches, missing "10" "11" and no others
-- Expected Result: Triggers semantic error: choices do not cover all possible values (exact coverage required)
-- Dependencies: None
-- =============================================================
entity mcs_smn3_ent is port(sel:in bit_vector(1 downto 0); y:out integer); end entity;
architecture bh of mcs_smn3_ent is
begin
  process(sel) begin
    case? sel is
      when "00" => y <= 0;
      when "01" => y <= 1;
    end case?;
  end process;
end architecture bh;
