-- =============================================================
-- Case ID: TC_AGGREGATE_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_AGGREGATE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Positive
-- Test Focus: Minimal form: single-element positional aggregate — assign (0 => '1', others => '0') to a bit_vector, verifying the minimal syntax of aggregate parentheses and a single element association
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_agg_single is
  port (
    y_o : out bit_vector(3 downto 0)
  );
end entity ent_agg_single;

architecture rtl of ent_agg_single is
  signal s : bit_vector(3 downto 0);
begin
  s <= (0 => '1', others => '0');
  y_o <= s;
end architecture rtl;
