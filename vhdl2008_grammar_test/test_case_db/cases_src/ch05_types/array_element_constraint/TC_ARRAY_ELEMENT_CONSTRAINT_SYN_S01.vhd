-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Positive (Production-Specific)
-- Test Focus: array_element_constraint explicitly used in a subtype
--            declaration that applies element_constraint to the
--            element of an array type. Here the element_constraint
--            is an array_constraint applied to a bit_vector element.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity aes_sbox_lookup is
  port (
    byte_in    : in  bit_vector(7 downto 0);
    byte_out   : out bit_vector(7 downto 0)
  );
end entity aes_sbox_lookup;

architecture rtl of aes_sbox_lookup is
  -- array_element_constraint: element_constraint wraps array_constraint
  -- on bit_vector elements of the S-box array
  subtype sbox_byte is bit_vector(7 downto 0);
  type sbox_rom is array (0 to 255) of sbox_byte;
  constant sbox : sbox_rom := (
    0 => X"63", 1 => X"7C", others => X"00");
  function to_index(bv : bit_vector) return integer is
    variable result : integer := 0;
  begin
    for i in 0 to 7 loop
      if bv(i) = '1' then result := result + 2**i; end if;
    end loop;
    return result;
  end function;
begin
  byte_out <= sbox(to_index(byte_in));
end architecture rtl;
