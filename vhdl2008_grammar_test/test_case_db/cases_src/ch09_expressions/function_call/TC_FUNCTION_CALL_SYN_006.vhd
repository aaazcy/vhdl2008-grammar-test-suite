-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: built-in function call: no-parameter built-in function now obtains the current simulation time, verifying the call to a VHDL predefined function
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_fc_builtin is
  port (
    clk  : in  bit;
    tout : out time
  );
end entity ent_fc_builtin;

architecture builtin_call of ent_fc_builtin is
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      tout <= now;
    end if;
  end process;
end architecture builtin_call;
