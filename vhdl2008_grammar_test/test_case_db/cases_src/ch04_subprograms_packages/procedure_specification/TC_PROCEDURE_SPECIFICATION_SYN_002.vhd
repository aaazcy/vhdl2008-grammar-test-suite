-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: procedure specification with overloaded designator shared across multiple procedure declarations differing by formal_parameter_list arity and parameter types
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_overload_ent is
  port(sel: in natural; x_val, y_val: in real; z_out: out real);
end entity;
architecture bh of ps_overload_ent is
  -- Overload 1: two real inputs, one real output
  procedure p_combine(a: in real; b: in real; signal result: out real) is
  begin
    result <= a + b;
  end procedure;
  -- Overload 2: three real inputs, one real output (different arity)
  procedure p_combine(a: in real; b: in real; c: in real; signal result: out real) is
  begin
    result <= a + b + c;
  end procedure;
  -- Overload 3: same arity, different type (integer variation)
  procedure p_combine(a: in integer; b: in integer; signal result: out integer) is
  begin
    result <= a + b;
  end procedure;
  signal s_tmp_real : real := 0.0;
  signal s_tmp_int  : integer := 0;
begin
  process(sel, x_val, y_val)
  begin
    if sel = 0 then
      p_combine(x_val, y_val, s_tmp_real);
    elsif sel = 1 then
      p_combine(x_val, y_val, 1.5, s_tmp_real);
    end if;
  end process;
  z_out <= s_tmp_real;
end architecture bh;
