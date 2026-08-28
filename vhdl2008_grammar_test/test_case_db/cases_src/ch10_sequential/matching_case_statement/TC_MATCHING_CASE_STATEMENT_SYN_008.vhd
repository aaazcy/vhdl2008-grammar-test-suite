-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Positive
-- Test Focus: matching case? with null branch: when "--" => null — execute null operation when don't-care matches all, verifying the validity of null in a matching case alternative
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mcs_syn8_ent is port(flag:in bit_vector(0 downto 0); din:in integer; y:out integer); end entity;
architecture bh of mcs_syn8_ent is
begin
  process(flag,din) begin
    y <= 0;
    case? flag is
      when "0" => y <= din;
      when "1" => null;
    end case?;
  end process;
end architecture bh;
