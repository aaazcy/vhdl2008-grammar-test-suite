-- =============================================================
-- Case ID: TC_VARIABLE_ASSIGNMENT_STATEMENT_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_VARIABLE_ASSIGNMENT_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: variable_assignment_statement ::= [ label : ] simple_variable_assignment | [ label : ] conditional_variable_assignment | [ label : ] selected_variable_assignment
-- Case Type: Positive
-- Test Focus: Simple variable assignment with type conversion: target is v_slv (std_logic_vector variable), the expression contains the type conversion to_unsigned(din,8), verifying an expression containing a function call in the simple_variable_assignment branch
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity vas_conv_ent is port(din:in integer range 0 to 255; y:out integer); end entity;
architecture bh of vas_conv_ent is
  signal s_out:integer:=0;
  function to_slv(v:integer; w:integer) return bit_vector is
    variable tmp:bit_vector(w-1 downto 0);
    variable val:integer:=v;
  begin
    for i in 0 to w-1 loop tmp(i):='1' when (val mod 2)=1 else '0'; val:=val/2; end loop;
    return tmp;
  end function;
begin
  process(din)
    variable v_slv:bit_vector(7 downto 0);
  begin
    v_slv := to_slv(din, 8);
    s_out <= din;
    y <= s_out;
  end process;
end architecture bh;
