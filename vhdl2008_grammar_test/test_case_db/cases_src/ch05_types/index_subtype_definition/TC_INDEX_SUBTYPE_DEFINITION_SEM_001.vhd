-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Positive
-- Test Focus: Semantic: unconstrained FIFO using index_subtype_definition
--            with natural range <>. The FIFO width and depth are
--            constrained at the subtype level using the box notation.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity generic_fifo is
  port (
    clk    : in  bit;
    wr     : in  bit;
    rd     : in  bit;
    din    : in  bit_vector(7 downto 0);
    dout   : out bit_vector(7 downto 0);
    empty  : out bit;
    full   : out bit
  );
end entity generic_fifo;

architecture rtl of generic_fifo is
  -- index_subtype_definition: natural range <>
  type fifo_mem is array (natural range <>) of bit_vector(7 downto 0);
  constant FIFO_DEPTH : natural := 8;
  subtype fifo_8 is fifo_mem(0 to FIFO_DEPTH - 1);
  signal mem   : fifo_8 := (others => X"00");
  signal wptr  : natural range 0 to FIFO_DEPTH - 1 := 0;
  signal rptr  : natural range 0 to FIFO_DEPTH - 1 := 0;
  signal count : natural range 0 to FIFO_DEPTH := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if wr = '1' and count < FIFO_DEPTH then
        mem(wptr) <= din;
        wptr <= (wptr + 1) mod FIFO_DEPTH;
        count <= count + 1;
      end if;
      if rd = '1' and count > 0 then
        dout <= mem(rptr);
        rptr <= (rptr + 1) mod FIFO_DEPTH;
        count <= count - 1;
      end if;
    end if;
  end process;
  empty <= '1' when count = 0 else '0';
  full  <= '1' when count = FIFO_DEPTH else '0';
end architecture rtl;
