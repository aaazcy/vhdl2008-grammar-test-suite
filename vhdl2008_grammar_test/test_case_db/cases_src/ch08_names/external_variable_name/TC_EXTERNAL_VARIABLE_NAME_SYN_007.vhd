-- =============================================================
-- Case ID: TC_EXTERNAL_VARIABLE_NAME_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_EXTERNAL_VARIABLE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.7
-- Production: external_variable_name ::= << variable external_pathname : subtype_indication >>
-- Case Type: Positive
-- Test Focus: External variable name using a package_pathname — alias pkg_shared is <<variable @work.shared_pkg.global_flags : bit_vector(3 downto 0)>> accesses a shared variable declared in the package through the package path, verifying the complete syntax of package_pathname in external_variable_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ext_var_pkg_path is
  port(clk : in bit; flags_out : out bit_vector(3 downto 0));
end entity;

architecture vhdl2008 of ext_var_pkg_path is
  alias pkg_shared is <<variable @work.shared_pkg.global_flags : bit_vector(3 downto 0)>>;
  signal latch_flags : bit_vector(3 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if rising_edge(clk) then latch_flags <= pkg_shared; end if;
  end process;
  flags_out <= latch_flags;
end architecture vhdl2008;
