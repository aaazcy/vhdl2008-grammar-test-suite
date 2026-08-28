-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_FUNCTION_CALL_PURE_RESTRICTION
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Negative
-- Rule Description: A pure function cannot modify its formal parameters or any global signals. It must not contain wait statements or signal assignments (unless impure).
-- Error Category: Pure function restriction violation
-- Test Focus: SMN: calling a function containing signal assignment inside a pure function — attempting to assign a global signal inside a pure function (default), violating the pure function restriction
-- Expected Result: Triggers error: pure function may not reference or assign to signals
-- Dependencies: None
-- =============================================================

entity ent_fc_smn_001 is
  port (clk : in bit);
end entity ent_fc_smn_001;

architecture pure_violation of ent_fc_smn_001 is
  signal s_side : integer := 0;
  function f_bad(n : integer) return integer is
  begin
    -- ERROR: Pure function cannot assign to signals
    s_side <= n;
    return n * 2;
  end function;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_side <= f_bad(5);
    end if;
  end process;
end architecture pure_violation;
