-- =============================================================
-- Case ID: TC_INTERFACE_PACKAGE_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_PACKAGE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_package_declaration ::= package identifier is new uninstantiated_package_name interface_package_generic_map_aspect
-- Case Type: Positive
-- Test Focus: Production-specific: exercises interface_package_declaration with a package instantiation in a generic context.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_package_decl_syn_s2 is
  port (
    clk : in  bit;
    d   : in  bit_vector(7 downto 0);
    q   : out bit_vector(7 downto 0)
  );
end entity interface_package_decl_syn_s2;

architecture rtl of interface_package_decl_syn_s2 is
  signal s_data : bit_vector(7 downto 0);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_data <= d;
      q <= s_data;
    end if;
  end process;
end architecture rtl;
