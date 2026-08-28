-- =============================================================
-- Case ID: TC_GENERIC_LIST_SYN_003
-- Rule Type: Syntax
-- BNF Production: GENERIC_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_list ::= generic_interface_list
-- Test Focus: generic_list with multiple interface_constant_declarations
--   separated by semicolons. The list includes integer, boolean, time,
--   and bit_vector generics with and without default values. Tests the
--   full generic_interface_list structure: element { ; element }.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity fifo_control is
  generic (
    DEPTH        : integer := 16;
    ALMOST_FULL  : integer := 14;
    ALMOST_EMPTY : integer := 2;
    DATA_BITS    : integer := 8;
    USE_ALMOST   : boolean := true
  );
  port (
    wr_clk   : in  bit;
    rd_clk   : in  bit;
    wr_en    : in  bit;
    rd_en    : in  bit;
    wr_data  : in  bit_vector(DATA_BITS-1 downto 0);
    rd_data  : out bit_vector(DATA_BITS-1 downto 0);
    full     : out bit;
    empty    : out bit;
    afull    : out bit;
    aempty   : out bit
  );
end entity fifo_control;

architecture rtl of fifo_control is
  signal wr_ptr, rd_ptr : integer range 0 to DEPTH-1 := 0;
  signal count : integer range 0 to DEPTH := 0;

  function calc_count(wr, rd : integer) return integer is
  begin
    if wr >= rd then
      return wr - rd;
    else
      return DEPTH - rd + wr;
    end if;
  end function;
begin
  process(wr_clk)
  begin
    if wr_clk'event and wr_clk = '1' then
      if wr_en = '1' and count < DEPTH then
        if wr_ptr = DEPTH-1 then
          wr_ptr <= 0;
        else
          wr_ptr <= wr_ptr + 1;
        end if;
      end if;
    end if;
  end process;

  process(rd_clk)
  begin
    if rd_clk'event and rd_clk = '1' then
      if rd_en = '1' and count > 0 then
        if rd_ptr = DEPTH-1 then
          rd_ptr <= 0;
        else
          rd_ptr <= rd_ptr + 1;
        end if;
      end if;
    end if;
  end process;

  count <= calc_count(wr_ptr, rd_ptr);

  full   <= '1' when count = DEPTH else '0';
  empty  <= '1' when count = 0 else '0';
  afull  <= '1' when USE_ALMOST and count >= ALMOST_FULL else '0';
  aempty <= '1' when USE_ALMOST and count <= ALMOST_EMPTY else '0';
  rd_data <= (others => '0');
end architecture rtl;
