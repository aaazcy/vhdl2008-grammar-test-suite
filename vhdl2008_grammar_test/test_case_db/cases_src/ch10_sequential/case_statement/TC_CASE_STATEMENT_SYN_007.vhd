-- =============================================================
-- Case ID: TC_CASE_STATEMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_CASE_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.9
-- Production: case_statement ::= [ case_label : ] case expression is case_statement_alternative { case_statement_alternative } end case [ case_label ] ;
-- Case Type: Positive
-- Test Focus: Case statement inside a function body: function priority_encode uses a case on a bit_vector input to select a return value via sequential decoding, verifying that case_statement is valid within a subprogram body (function) and can drive a return statement from each branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity case_in_fn_ent is
  port(addr:in bit_vector(2 downto 0); y:out integer);
end entity;
architecture bh of case_in_fn_ent is
  function priority_encode(addr:bit_vector(2 downto 0)) return integer is
  begin
    case addr is
      when "100" => return 4;
      when "101" => return 5;
      when "110" => return 6;
      when "111" => return 7;
      when others => return 0;
    end case;
  end function;
begin
  process(addr) is
    variable v_result:integer:=0;
  begin
    v_result:=priority_encode(addr);
    y<=v_result;
  end process;
end architecture bh;
