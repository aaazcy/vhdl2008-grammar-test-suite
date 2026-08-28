-- =============================================================
-- Case ID: TC_PREFIX_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PREFIX
-- Standard Reference: IEEE 1076-2008 Section 8.3
-- Production: prefix ::= name | function_call
-- Case Type: Positive
-- Test Focus: prefix as selected_name used in attribute_name — a selected_name (record.field) as prefix for attribute reference, exercising name->selected_name->prefix chain within prefix
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prefix_sel_name_ent is
  port(data_word : in bit_vector(15 downto 0); byte_sel : in bit; byte_out : out bit_vector(7 downto 0));
end entity;

architecture bh of prefix_sel_name_ent is
  type word_t is record
    high_byte : bit_vector(7 downto 0);
    low_byte  : bit_vector(7 downto 0);
  end record;
  signal word_reg : word_t := (high_byte=>X"00", low_byte=>X"00");
  signal result : bit_vector(7 downto 0) := X"00";
begin
  process(data_word, byte_sel)
    variable v_word : word_t;
  begin
    v_word.high_byte := data_word(15 downto 8);   -- prefix: selected_name 'v_word.high_byte'
    v_word.low_byte  := data_word(7 downto 0);    -- prefix: selected_name 'v_word.low_byte'
    word_reg <= v_word;
    if byte_sel = '1' then
      result <= word_reg.high_byte;               -- prefix: selected_name in attribute context
    else
      result <= word_reg.low_byte;
    end if;
  end process;
  byte_out <= result;
end architecture bh;
