-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Positive
-- Test Focus: package_declarative_part: attribute_declaration and attribute_specification — exercises the attribute-specific alternatives of package_declarative_item, which are valid in both package declarations and architectures
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdp_attributes is
  port (
    addr : in  bit_vector(3 downto 0);
    data : out bit_vector(7 downto 0)
  );
end entity;

architecture test of pdp_attributes is
  -- attribute_declaration (valid package_declarative_item)
  attribute ram_init : string;
  -- attribute_specification (valid package_declarative_item)
  attribute ram_init of all : architecture is "test_synth";

  type rom_t is array(0 to 15) of bit_vector(7 downto 0);
  constant C_ROM : rom_t := (0 => X"00", 1 => X"11", others => X"FF");

  function f_rom_read(a : bit_vector(3 downto 0)) return bit_vector is
    variable idx : natural;
  begin
    idx := 0;
    for i in a'range loop
      if a(i) = '1' then
        idx := idx + 2**i;
      end if;
    end loop;
    return C_ROM(idx);
  end function;
begin
  data <= f_rom_read(addr);
end architecture test;
