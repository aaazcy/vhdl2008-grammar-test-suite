-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: direct element_constraint using
--            both array_constraint and record_constraint in the
--            same architecture. A CRC lookup table with per-entry
--            metadata using both constraint forms.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity crc_lookup_table is
  port (
    data_in  : in  bit_vector(7 downto 0);
    crc_out  : out bit_vector(15 downto 0)
  );
end entity crc_lookup_table;

architecture rtl of crc_lookup_table is
  -- element_constraint: array_constraint on bit_vector element
  subtype crc16_t is bit_vector(15 downto 0);
  type crc_lut is array (0 to 255) of crc16_t;
  -- element_constraint: record_constraint for entry metadata
  type lut_entry is record
    crc_val : crc16_t;
    valid   : boolean;
  end record;
  type aug_lut is array (0 to 3) of lut_entry;
  signal quick_lut : aug_lut;
  constant full_lut : crc_lut := (0 => X"0000", 1 => X"1021", others => X"0000");
  function to_int (bv : bit_vector) return integer is
    variable r : integer := 0;
  begin
    for i in 0 to 7 loop
      if bv(i) = '1' then r := r + 2**i; end if;
    end loop;
    return r;
  end function;
begin
  quick_lut(0).crc_val <= full_lut(to_int(data_in));
  quick_lut(0).valid   <= true;
  crc_out <= quick_lut(0).crc_val;
end architecture rtl;
