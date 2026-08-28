-- =============================================================
-- Case ID: TC_QUALIFIED_EXPRESSION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_QUALIFIED_EXPRESSION
-- Standard Reference: IEEE 1076-2008 Section 9.3.6
-- Production: qualified_expression ::= type_mark ' ( expression ) | type_mark ' aggregate
-- Case Type: Positive
-- Test Focus: use as a function argument: f(bit_vector'(d)) wraps the function actual parameter in a qualified expression, verifying that a qualified expression can serve as an actual parameter
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_qe_func is
  port (
    d    : in  bit_vector(3 downto 0);
    dout : out integer
  );
end entity ent_qe_func;

architecture func_arg of ent_qe_func is
  function f_bv_to_int(bv : bit_vector) return integer is
    variable v : integer := 0;
  begin
    for i in bv'range loop
      if bv(i) = '1' then
        v := v + 2**i;
      end if;
    end loop;
    return v;
  end function;
begin
  dout <= f_bv_to_int(bit_vector'(d));
end architecture func_arg;
