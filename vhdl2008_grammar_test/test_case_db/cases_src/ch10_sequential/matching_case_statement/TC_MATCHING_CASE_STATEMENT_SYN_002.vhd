-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Positive
-- Test Focus: Minimal matching case? with bit_vector: case? sel is when "00"=>... when "01"=>... — VHDL 2008 matching case used for bit_vector selector, two branches exactly covering
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mcs_syn2_ent is port(sel:in bit_vector(1 downto 0); a,b:in integer; y:out integer); end entity;
architecture bh of mcs_syn2_ent is
begin
  process(sel,a,b) begin
    case? sel is
      when "00" => y <= a;
      when "01" => y <= b;
      when "10" => y <= a + b;
      when "11" => y <= 0;
    end case?;
  end process;
end architecture bh;
