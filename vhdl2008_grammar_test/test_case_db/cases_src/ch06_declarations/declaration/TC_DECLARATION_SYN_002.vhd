-- =============================================================
-- Case ID: TC_DECLARATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.1
-- Production: declaration ::= type_declaration | subtype_declaration | object_declaration | interface_declaration | alias_declaration | attribute_declaration | component_declaration | group_template_declaration | group_declaration | ...
-- Case Type: Positive
-- Test Focus: Exercises declaration via type_declaration and subtype_declaration paths in a package context with enumerated types.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package declaration_syn2_pkg is
  constant PKG_VERSION : integer := 2;
  type t_fsm_state is (IDLE, BUSY, DONE, ERROR_ST);
  subtype t_active_state is t_fsm_state range BUSY to DONE;
end package declaration_syn2_pkg;

entity declaration_syn2 is
  port (clk : in bit; state_out : out integer range 0 to 3);
end entity declaration_syn2;

architecture rtl of declaration_syn2 is
  signal s_idx : integer range 0 to 3 := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if s_idx = 3 then s_idx <= 0;
      else s_idx <= s_idx + 1; end if;
    end if;
  end process;
  state_out <= s_idx;
end architecture rtl;
