-- =============================================================
-- Case ID: TC_INTERFACE_OBJECT_DECLARATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_OBJECT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_object_declaration ::=
--   interface_constant_declaration
--   | interface_signal_declaration
--   | interface_variable_declaration
--   | interface_file_declaration
-- Case Type: Positive
-- Test Focus: Interface object declarations in entity header:
--   interface_constant_declaration in generic clause,
--   interface_signal_declaration in port clause.
--   Demonstrates the two most common hardware contexts.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity iface_obj_entity_header is
  generic (
    constant  DATA_BITS : in positive := 8;
    constant  FIFO_DEPTH : natural    := 16
  );
  port (
    signal    clk     : in  bit;
    signal    wr_en   : in  bit;
    signal    rd_en   : in  bit;
    signal    din     : in  bit_vector(DATA_BITS - 1 downto 0);
    signal    dout    : out bit_vector(DATA_BITS - 1 downto 0);
    signal    empty   : out bit;
    signal    full    : out bit
  );
end entity iface_obj_entity_header;

architecture rtl of iface_obj_entity_header is
  type t_fifo_mem is array(0 to FIFO_DEPTH - 1) of bit_vector(DATA_BITS - 1 downto 0);
  signal mem      : t_fifo_mem := (others => (others => '0'));
  signal wr_ptr   : natural range 0 to FIFO_DEPTH - 1 := 0;
  signal rd_ptr   : natural range 0 to FIFO_DEPTH - 1 := 0;
  signal count    : natural range 0 to FIFO_DEPTH := 0;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if wr_en = '1' and count < FIFO_DEPTH then
        mem(wr_ptr) <= din;
        wr_ptr <= (wr_ptr + 1) mod FIFO_DEPTH;
        count  <= count + 1;
      end if;
      if rd_en = '1' and count > 0 then
        dout   <= mem(rd_ptr);
        rd_ptr <= (rd_ptr + 1) mod FIFO_DEPTH;
        count  <= count - 1;
      end if;
    end if;
  end process;
  empty <= '1' when count = 0 else '0';
  full  <= '1' when count = FIFO_DEPTH else '0';
end architecture rtl;
