-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_FUNCTION_CALL_OVERLOAD
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Negative
-- Rule Description: When multiple overloaded functions have the same name, the compiler resolves the call based on the types of actual parameters. Ambiguity occurs when more than one candidate matches.
-- Error Category: Overload resolution ambiguity
-- Test Focus: SMN: overloaded function call ambiguity — same-name function f_conv has two overloaded versions (integer->integer, real->integer), using a nested call returning integer as the actual argument causes ambiguity
-- Expected Result: Triggers error: ambiguous function call — overload resolution failed
-- Dependencies: None
-- =============================================================

entity ent_fc_smn_002 is
  port (v : in integer);
end entity ent_fc_smn_002;

architecture ambiguous of ent_fc_smn_002 is
  function f_conv(x : integer) return integer is
  begin return x; end function;
  function f_conv(x : real) return integer is
  begin return integer(x); end function;
  signal s : integer;
begin
  process(v)
  begin
    s <= f_conv(v);
    wait;
  end process;
end architecture ambiguous;
