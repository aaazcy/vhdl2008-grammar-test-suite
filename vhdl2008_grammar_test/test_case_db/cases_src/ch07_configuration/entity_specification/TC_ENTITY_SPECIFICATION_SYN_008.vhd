-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Positive
-- Test Focus: entity_specification with entity_class "procedure" and entity_designator carrying a signature -- exercises entity_name_list containing an entity_designator with signature followed by entity_class "procedure"; the signature disambiguates which overloaded procedure the attribute targets
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity espec_proc_class is
  port(
    addr    : in  bit_vector(5 downto 0);
    wr_data : in  bit_vector(7 downto 0);
    wr_en   : in  bit;
    rd_data : out bit_vector(7 downto 0)
  );
end entity;

architecture rtl of espec_proc_class is
  attribute syn_ramstyle : string;

  -- Overloaded procedure #1: synchronous write
  procedure p_mem_acc(adr : bit_vector(5 downto 0); dat : bit_vector(7 downto 0)) is
  begin
    report "sync write" severity note;
  end procedure;

  -- Overloaded procedure #2: asynchronous read (diff signature count)
  procedure p_mem_acc(adr : bit_vector(5 downto 0)) is
  begin
    report "async read" severity note;
  end procedure;

  -- entity_specification with signature-disambiguated entity_designator
  attribute syn_ramstyle of p_mem_acc
    [bit_vector, bit_vector] : procedure is "write_first";

  signal rd_buf : bit_vector(7 downto 0) := X"00";
begin
  process(wr_en, addr, wr_data)
  begin
    if wr_en = '1' then
      p_mem_acc(addr, wr_data);
    else
      p_mem_acc(addr);
    end if;
  end process;
  rd_data <= rd_buf;
end architecture rtl;
