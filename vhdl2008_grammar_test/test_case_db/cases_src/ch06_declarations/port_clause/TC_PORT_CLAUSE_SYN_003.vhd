-- =============================================================
-- Case ID: TC_PORT_CLAUSE_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PORT_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: port_clause ::= port ( port_list ) ;
-- Case Type: Positive
-- Test Focus: Exercises port_clause with unconstrained array ports and generic-dependent port widths for a flexible FIFO.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity port_clause_fifo is
  generic (
    DATA_WIDTH : integer := 8;
    FIFO_DEPTH : integer := 16
  );
  port (
    wr_clk   : in  bit;
    rd_clk   : in  bit;
    wr_en    : in  bit;
    rd_en    : in  bit;
    data_in  : in  bit_vector(DATA_WIDTH-1 downto 0);
    data_out : out bit_vector(DATA_WIDTH-1 downto 0);
    full     : out bit;
    empty    : out bit
  );
end entity port_clause_fifo;

architecture rtl of port_clause_fifo is
  type t_mem is array(0 to FIFO_DEPTH-1) of bit_vector(DATA_WIDTH-1 downto 0);
  signal s_mem : t_mem;
  signal s_wr_ptr : integer range 0 to FIFO_DEPTH-1 := 0;
  signal s_rd_ptr : integer range 0 to FIFO_DEPTH-1 := 0;
  signal s_count  : integer range 0 to FIFO_DEPTH := 0;
begin
  process(wr_clk)
  begin
    if wr_clk'event and wr_clk = '1' then
      if wr_en = '1' and s_count < FIFO_DEPTH then
        s_mem(s_wr_ptr) <= data_in;
        s_wr_ptr <= (s_wr_ptr + 1) mod FIFO_DEPTH;
      end if;
    end if;
  end process;
  process(rd_clk)
  begin
    if rd_clk'event and rd_clk = '1' then
      if rd_en = '1' and s_count > 0 then
        data_out <= s_mem(s_rd_ptr);
        s_rd_ptr <= (s_rd_ptr + 1) mod FIFO_DEPTH;
      end if;
    end if;
  end process;
  empty <= '1' when s_count = 0 else '0';
  full  <= '1' when s_count = FIFO_DEPTH else '0';
end architecture rtl;
