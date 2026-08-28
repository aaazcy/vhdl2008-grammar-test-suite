-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External variable name via package pathname — <<variable @work.state_pkg.current_state : integer>> references a shared variable in a package through the package_pathname form
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_var_pkg_mon is
  port(local_state : in integer; state_valid : out bit);
end entity;

architecture vhdl2008 of ext_var_pkg_mon is
  alias shared_state is <<variable @work.state_pkg.current_state : integer>>;
  signal valid_reg : bit := '0';
begin
  process(local_state)
  begin
    if local_state = shared_state then
      valid_reg <= '1';
    else
      valid_reg <= '0';
    end if;
  end process;
  state_valid <= valid_reg;
end architecture vhdl2008;
