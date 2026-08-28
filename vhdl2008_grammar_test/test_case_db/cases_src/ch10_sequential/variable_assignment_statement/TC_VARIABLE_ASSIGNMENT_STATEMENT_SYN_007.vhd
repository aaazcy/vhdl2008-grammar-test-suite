-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: variable_assignment_statement ::= [ label : ] simple_variable_assignment | [ label : ] conditional_variable_assignment | [ label : ] selected_variable_assignment
-- Case Type: Positive
-- Test Focus: Labeled simple variable assignment + slice expression: label "l_hi", target is v_hi, the expression assigns the slice data(15 downto 8), verifying simple_variable_assignment with a label and a slice expression
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity vas_slice_ent is port(data:in bit_vector(15 downto 0); y:out integer); end entity;
architecture bh of vas_slice_ent is signal s_res:integer:=0;
  function to_int(b:bit_vector) return integer is
    variable r:integer:=0;
  begin
    for i in b'range loop if b(i)='1' then r:=r+2**(i-b'low); end if; end loop;
    return r;
  end function;
begin
  process(data)
    variable v_hi:bit_vector(7 downto 0);
  begin
    l_hi: v_hi := data(15 downto 8);
    s_res <= to_int(v_hi);
    y <= s_res;
  end process;
end architecture bh;
