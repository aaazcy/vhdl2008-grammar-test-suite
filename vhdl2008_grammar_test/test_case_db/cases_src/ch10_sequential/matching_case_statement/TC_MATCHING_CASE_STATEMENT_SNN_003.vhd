-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Negative
-- Test Focus: SNN: missing is keyword — `case? sel when "00"=>...` has expression and when but no is separator
-- Expected Result: Triggers syntax error: missing 'is' after case expression
-- Dependencies: None
-- =============================================================
entity mcs_snn3_ent is port(sel:in bit_vector(1 downto 0); y:out integer); end entity;
architecture bh of mcs_snn3_ent is
begin
  process(sel) begin
    case? sel
      when "00" => y <= 0;
      when "01" => y <= 1;
    end case?;
  end process;
end architecture bh;
