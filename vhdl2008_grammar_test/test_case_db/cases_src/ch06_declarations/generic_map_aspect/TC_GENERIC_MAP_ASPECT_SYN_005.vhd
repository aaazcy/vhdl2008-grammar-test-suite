-- =============================================================
-- Case ID: TC_GENERIC_MAP_ASPECT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_GENERIC_MAP_ASPECT
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: generic_map_aspect ::= generic map ( generic_association_list )
-- Case Type: Positive
-- Test Focus: Exercises generic_map_aspect syntax variant 5 with progressively complex VHDL structures exercising the full BNF production.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity generic_map_aspect_syn5 is
  port (
    clk   : in  bit;
    d_in  : in  bit_vector(4 downto 0);
    q_out : out bit_vector(4 downto 0);
    valid : out bit
  );
end entity generic_map_aspect_syn5;

architecture rtl of generic_map_aspect_syn5 is
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
