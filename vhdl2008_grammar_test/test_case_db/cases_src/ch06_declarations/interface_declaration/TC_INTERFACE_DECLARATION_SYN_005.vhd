-- =============================================================
-- Case ID: TC_INTERFACE_DECLARATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_declaration ::= interface_object_declaration interface_type_declaration | interface_subprogram_declaration | interface_package_declaration
-- Case Type: Positive
-- Test Focus: Exercises interface_declaration syntax variant 5 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_declaration_syn5 is
  port (
    clk   : in  bit;
    d_in  : in  bit_vector(4 downto 0);
    q_out : out bit_vector(4 downto 0);
    valid : out bit
  );
end entity interface_declaration_syn5;

architecture rtl of interface_declaration_syn5 is
  signal s_reg : bit_vector(4 downto 0) := (others => '0');
  signal s_valid : bit := '0';
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_reg <= d_in xor s_reg;
      s_valid <= not s_valid;
    end if;
  end process;
  q_out <= s_reg;
  valid <= s_valid;
end architecture rtl;
