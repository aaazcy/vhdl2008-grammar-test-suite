-- =============================================================
-- Case ID: TC_INDEX_SUBTYPE_DEFINITION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_INDEX_SUBTYPE_DEFINITION
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: index_subtype_definition ::= type_mark range <>
-- Case Type: Positive
-- Test Focus: index_subtype_definition with a user-defined integer
--            type as type_mark. A memory controller using a custom
--            address range type for the index.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity memory_controller_var is
  port (
    addr    : in  integer range 0 to 1023;
    wdata   : in  bit_vector(31 downto 0);
    rdata   : out bit_vector(31 downto 0);
    we      : in  bit
  );
end entity memory_controller_var;

architecture rtl of memory_controller_var is
  type mem_addr is range 0 to 1023;
  -- index_subtype_definition: type_mark = mem_addr (user-defined), range <>
  type mem_array is array (mem_addr range <>) of bit_vector(31 downto 0);
  subtype main_mem is mem_array(0 to 1023);
  signal mem : main_mem := (others => X"00000000");
begin
  process(we, addr, wdata)
  begin
    if we = '1' then
      mem(mem_addr(addr)) <= wdata;
    end if;
    rdata <= mem(mem_addr(addr));
  end process;
end architecture rtl;
