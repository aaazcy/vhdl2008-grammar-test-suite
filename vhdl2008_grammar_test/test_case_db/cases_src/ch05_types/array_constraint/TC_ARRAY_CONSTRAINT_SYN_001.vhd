-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Positive
-- Test Focus: Index constraint with ascending range on unconstrained array subtype — exercises the index_constraint branch of array_constraint
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity array_ctr_ascending_idx is
  port(
    addr_in  : in  integer range 0 to 31;
    data_out : out bit_vector(7 downto 0)
  );
end entity;

architecture mem_lookup of array_ctr_ascending_idx is
  type t_rom is array (natural range <>) of bit_vector(7 downto 0);
  subtype t_rom32 is t_rom(0 to 31);
  constant C_ROM_DATA : t_rom32 := (
     0 => x"00",  1 => x"01",  2 => x"02",  3 => x"03",
     4 => x"04",  5 => x"05",  6 => x"06",  7 => x"07",
     8 => x"08",  9 => x"09", 10 => x"0A", 11 => x"0B",
    12 => x"0C", 13 => x"0D", 14 => x"0E", 15 => x"0F",
    16 => x"10", 17 => x"11", 18 => x"12", 19 => x"13",
    20 => x"14", 21 => x"15", 22 => x"16", 23 => x"17",
    24 => x"18", 25 => x"19", 26 => x"1A", 27 => x"1B",
    28 => x"1C", 29 => x"1D", 30 => x"1E", 31 => x"1F"
  );
begin
  data_out <= C_ROM_DATA(addr_in);
end architecture;
