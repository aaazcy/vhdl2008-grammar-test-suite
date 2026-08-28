-- =============================================================
-- Case ID: TC_INTERFACE_LIST_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.4
-- Production: interface_list ::= interface_element { ; interface_element }
-- Case Type: Positive
-- Test Focus: Exercises interface_list with multiple interface elements separated by semicolons in an entity generic/port clause.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_list_syn3 is
  generic (
    DATA_WIDTH : integer := 8;
    ADDR_WIDTH : integer := 4;
    ENABLE_PIPELINE : boolean := true
  );
  port (
    clk   : in  bit;
    addr  : in  bit_vector(ADDR_WIDTH-1 downto 0);
    wdata : in  bit_vector(DATA_WIDTH-1 downto 0);
    rdata : out bit_vector(DATA_WIDTH-1 downto 0);
    we    : in  bit
  );
end entity interface_list_syn3;

architecture rtl of interface_list_syn3 is
  type t_mem is array(0 to 2**ADDR_WIDTH-1) of bit_vector(DATA_WIDTH-1 downto 0);
  signal s_mem : t_mem := (others => (others => '0'));
  signal s_rdata : bit_vector(DATA_WIDTH-1 downto 0);

  function to_integer(v : bit_vector) return integer is
    variable r : integer := 0;
  begin
    for i in v'range loop
      if v(i) = '1' then r := r + 2**i; end if;
    end loop;
    return r;
  end function;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      if we = '1' then
        s_mem(to_integer(addr)) <= wdata;
      end if;
      s_rdata <= s_mem(to_integer(addr));
    end if;
  end process;
  rdata <= s_rdata;
end architecture rtl;
