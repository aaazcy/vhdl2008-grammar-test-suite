-- =============================================================
-- Case ID: TC_GROUP_DECLARATION_SYN_S02
-- Rule Type: Syntax
-- Related Rule ID: BNF_GROUP_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.9
-- Production: group_declaration ::= group identifier : group_template_name ( group_constituent_list ) ;
-- Case Type: Positive
-- Test Focus: Production-specific: exercises group_declaration for grouping related signals in a bus interface.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity group_decl_syn_s2 is
  port (
    clk    : in  bit;
    addr   : in  bit_vector(7 downto 0);
    data   : in  bit_vector(7 downto 0);
    wr_en  : in  bit;
    result : out bit_vector(7 downto 0)
  );
end entity group_decl_syn_s2;

architecture rtl of group_decl_syn_s2 is
  group signal_pair is (signal, signal);
  signal s_addr_reg, s_data_reg : bit_vector(7 downto 0);
  group g_bus_inputs : signal_pair (s_addr_reg, s_data_reg);
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_addr_reg <= addr;
      s_data_reg <= data;
      if wr_en = '1' then
        result <= s_data_reg;
      end if;
    end if;
  end process;
end architecture rtl;
