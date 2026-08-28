-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: comprehensive demonstration: nested call f_scale(f_clamp(din, 0, 255)) uses the return value of one function call directly as the actual argument of another function call, verifying nested function_call and multi-function composition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_fc_nested is
  port (
    din  : in  integer;
    dout : out integer
  );
end entity ent_fc_nested;

architecture nested_call of ent_fc_nested is
  function f_clamp(v, lo, hi : integer) return integer is
  begin
    if v < lo then return lo;
    elsif v > hi then return hi;
    else return v;
    end if;
  end function;
  function f_scale(v : integer) return integer is
  begin
    return v * 2;
  end function;
begin
  dout <= f_scale(f_clamp(din, 0, 255));
end architecture nested_call;
