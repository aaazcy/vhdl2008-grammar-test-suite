-- =============================================================
-- Case ID: TC_CONSTRAINED_ARRAY_DEFINITION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONSTRAINED_ARRAY_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: constrained_array_definition ::=
--   array index_constraint of element_subtype_indication
-- Case Type: Positive
-- Test Focus: Constrained array using integer range expression in
--            the index_constraint. A circular buffer for a UART
--            TX FIFO with constrained depth.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity uart_tx_fifo is
  port (
    clk      : in  bit;
    wr       : in  bit;
    rd       : in  bit;
    data_in  : in  bit_vector(7 downto 0);
    data_out : out bit_vector(7 downto 0);
    full     : out bit
  );
end entity uart_tx_fifo;

architecture rtl of uart_tx_fifo is
  constant FIFO_DEPTH : integer := 16;
  -- constrained_array_definition: index_constraint uses constant expression
  type fifo_mem is array (0 to FIFO_DEPTH - 1) of bit_vector(7 downto 0);
  signal mem    : fifo_mem := (others => X"00");
  signal wptr   : integer range 0 to FIFO_DEPTH - 1 := 0;
  signal rptr   : integer range 0 to FIFO_DEPTH - 1 := 0;
  signal count  : integer range 0 to FIFO_DEPTH := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if wr = '1' and count < FIFO_DEPTH then
        mem(wptr) <= data_in;
        wptr <= (wptr + 1) mod FIFO_DEPTH;
        count <= count + 1;
      end if;
      if rd = '1' and count > 0 then
        data_out <= mem(rptr);
        rptr <= (rptr + 1) mod FIFO_DEPTH;
        count <= count - 1;
      end if;
    end if;
  end process;
  full <= '1' when count = FIFO_DEPTH else '0';
end architecture rtl;
