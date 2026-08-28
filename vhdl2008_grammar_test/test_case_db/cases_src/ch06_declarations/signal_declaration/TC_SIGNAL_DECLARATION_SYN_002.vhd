-- =============================================================
-- Case ID: TC_SIGNAL_DECLARATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_SIGNAL_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.3
-- Production: signal_declaration ::= signal identifier_list : subtype_indication [ signal_kind ] [ := expression ] ;
-- Case Type: Positive
-- Test Focus: Exercises signal_declaration with array-typed signals and aggregate initializers for a register file.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity signal_decl_syn2 is
  port (
    clk      : in  bit;
    wr_addr  : in  integer range 0 to 7;
    wr_data  : in  bit_vector(7 downto 0);
    wr_en    : in  bit;
    rd_addr  : in  integer range 0 to 7;
    rd_data  : out bit_vector(7 downto 0)
  );
end entity signal_decl_syn2;

architecture rtl of signal_decl_syn2 is
  type t_regfile is array(0 to 7) of bit_vector(7 downto 0);
  signal s_regs : t_regfile := (others => (others => '0'));
  signal s_rd_data : bit_vector(7 downto 0) := (others => '0');
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if wr_en = '1' then
        s_regs(wr_addr) <= wr_data;
      end if;
      s_rd_data <= s_regs(rd_addr);
    end if;
  end process;
  rd_data <= s_rd_data;
end architecture rtl;
