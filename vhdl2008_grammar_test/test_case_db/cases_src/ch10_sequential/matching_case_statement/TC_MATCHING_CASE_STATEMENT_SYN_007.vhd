-- =============================================================
-- Case ID: TC_MATCHING_CASE_STATEMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_MATCHING_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: matching_case_statement ::= [ label : ] case ? expression is matching_case_statement_alternative { ... } end case ? [ label ] ;
-- Case Type: Positive
-- Test Focus: matching case? multi-statement alternative: when "00"=>body contains signal assignment + variable assignment + if-statement — verifying that a matching case alternative body can contain multiple sequential statements
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity mcs_syn7_ent is port(sel:in bit_vector(1 downto 0); a,b:in integer; y:out integer); end entity;
architecture bh of mcs_syn7_ent is
begin
  process(sel,a,b) is
    variable v_tmp : integer;
  begin
    case? sel is
      when "00" =>
        v_tmp := a + b;
        if v_tmp > 100 then v_tmp := 100; end if;
        y <= v_tmp;
      when "01" =>
        y <= a - b;
      when "10" =>
        v_tmp := a * b;
        y <= v_tmp;
      when "11" =>
        y <= 0;
    end case?;
  end process;
end architecture bh;
