-- =============================================================
-- Case ID: TC_CONDITION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITION
-- Standard Reference: IEEE 1076-2008 Section 9.1
-- Production: condition ::= expression
-- Case Type: Positive
-- Test Focus: Function returning a boolean value as the condition: the if f_is_odd(a) form, calling a function that returns type boolean as the condition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_cond_func is
  port (
    val  : in  integer;
    dout : out bit
  );
end entity ent_cond_func;

architecture func_cond of ent_cond_func is
  function f_is_odd(n : integer) return boolean is
  begin
    return (n mod 2) = 1;
  end function;
begin
  process(val)
  begin
    if f_is_odd(val) then
      dout <= '1';
    else
      dout <= '0';
    end if;
  end process;
end architecture func_cond;
