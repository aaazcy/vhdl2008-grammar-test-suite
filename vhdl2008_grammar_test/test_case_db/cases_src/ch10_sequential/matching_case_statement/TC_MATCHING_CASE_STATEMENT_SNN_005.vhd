-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Negative
-- Test Focus: SNN: EOF truncation — `case? sel is when "00"=>y<=0;` has no end case? closure
-- Expected Result: Triggers syntax error: unexpected end of file, missing 'end case?'
-- Dependencies: None
-- =============================================================
entity mcs_snn5_ent is port(sel:in bit_vector(1 downto 0); y:out integer); end entity;
architecture bh of mcs_snn5_ent is
begin
  process(sel) begin
    case? sel is
      when "00" => y <= 0;
      when "01" => y <= 1;
  end process;
end architecture bh;
