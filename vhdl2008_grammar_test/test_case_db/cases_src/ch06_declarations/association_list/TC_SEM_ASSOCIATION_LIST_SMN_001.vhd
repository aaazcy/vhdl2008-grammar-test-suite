-- =============================================================
-- Case ID: TC_SEM_ASSOCIATION_LIST_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_ASSOCIATION_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1
-- Production: association_list ::= association_element
--              { , association_element }
-- Case Type: Negative (Semantic)
-- Test Focus: association_list — SEMANTIC ERROR: duplicate formal_part
--             names in the association list. The same port 'a' is
--             associated twice. The syntax is valid (each element is
--             a proper association_element, and commas separate them),
--             but a port cannot be associated more than once.
-- Expected Result: Triggers semantic/elaboration error (duplicate association)
-- Dependencies: None
-- =============================================================

entity association_list_smn1 is
  port (
    x : in  bit_vector(1 downto 0);
    y : out bit
  );
end entity association_list_smn1;

architecture arch of association_list_smn1 is

  component mux_2to1 is
    port (
      a : in  bit;
      b : in  bit;
      sel : in bit;
      z : out bit
    );
  end component;

  signal s_z : bit;

begin

  -- SEMANTIC ERROR: port 'a' appears twice in the association list.
  -- The syntax is valid (association_list with comma-separated elements),
  -- but associating two different signals (x(0) and x(1)) to the same
  -- formal port 'a' is a semantic error — a port cannot be driven by
  -- two different actuals simultaneously.
  u_mux : component mux_2to1
    port map (
      a   => x(0),
      b   => x(1),
      sel => x(1),
      a   => x(1),
      z   => s_z
    );

  y <= s_z;

end architecture arch;
