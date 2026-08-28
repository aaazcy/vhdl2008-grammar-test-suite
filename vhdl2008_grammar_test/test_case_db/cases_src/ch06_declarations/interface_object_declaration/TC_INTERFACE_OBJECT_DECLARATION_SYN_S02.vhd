-- =============================================================
-- Case ID: TC_INTERFACE_OBJECT_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_object_declaration ::= interface_constant_declaration | interface_signal_declaration | interface_variable_declaration | interface_file_declaration
-- Case Type: Positive
-- Test Focus: Production-specific: exercises interface_object_declaration through interface_constant and interface_signal alternatives.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_object_decl_syn_s2 is
  generic (
    WIDTH : integer := 8
  );
  port (
    clk    : in  bit;
    data   : in  bit_vector(WIDTH-1 downto 0);
    result : out bit_vector(WIDTH-1 downto 0)
  );
end entity interface_object_decl_syn_s2;

architecture rtl of interface_object_decl_syn_s2 is
  signal s_reg : bit_vector(WIDTH-1 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_reg <= data;
      result <= s_reg xor data;
    end if;
  end process;
end architecture rtl;
