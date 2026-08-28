-- =============================================================
-- Case ID: TC_ENTITY_DESIGNATOR_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_designator ::= entity_tag [ signature ]
-- Case Type: Positive
-- Test Focus: entity_tag with procedure signature -- exercises entity_designator that identifies an overloaded procedure using signature [type_mark, type_mark] (no return) in an attribute specification; procedures have no return type so the signature omits the "return" clause
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ed_proc_sig is
  port(
    addr     : in  bit_vector(7 downto 0);
    data_in  : in  bit_vector(7 downto 0);
    we       : in  bit;
    data_out : out bit_vector(7 downto 0)
  );
end entity;

architecture rtl of ed_proc_sig is
  attribute syn_ramstyle : string;

  -- Overloaded procedure #1: write to RAM
  procedure p_store(adr : bit_vector(7 downto 0); val : bit_vector(7 downto 0)) is
  begin
    report "storing at " & integer'image(0) severity note;
  end procedure;

  -- Overloaded procedure #2: read from RAM
  procedure p_store(adr : bit_vector(7 downto 0); val : integer) is
  begin
    report "storing integer" severity note;
  end procedure;

  -- entity_designator with procedure signature (no return keyword needed)
  attribute syn_ramstyle of p_store
    [bit_vector, bit_vector] : procedure is "block_ram";

  signal mem_out : bit_vector(7 downto 0) := X"00";
begin
  process(we, addr, data_in)
  begin
    if we = '1' then
      p_store(addr, data_in);
    end if;
  end process;
  data_out <= mem_out;
end architecture rtl;
