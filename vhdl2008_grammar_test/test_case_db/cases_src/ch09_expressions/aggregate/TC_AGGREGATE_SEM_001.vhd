-- =============================================================
-- Case ID: TC_AGGREGATE_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_AGGREGATE_TYPES
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: aggregate ::= ( element_association { , element_association } )
-- Case Type: Positive
-- Rule Description: An aggregate must provide exactly one association for each element of the composite type. Named associations use choices to specify index values or field names. OTHERS can cover remaining elements.
-- Test Focus: Semantic correctness of aggregate on two composite types, array and record — the array aggregate uses others and the record aggregate uses named associations, verifying the element coverage and type matching semantics of aggregates
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_sem_agg_types is
  port (
    a_i : in  bit;
    y_o : out bit_vector(7 downto 0)
  );
end entity ent_sem_agg_types;

architecture rtl of ent_sem_agg_types is
  type t_ctl is record
    en   : bit;
    mode : bit;
  end record;
  signal ctl : t_ctl;
  signal vec : bit_vector(3 downto 0);
begin
  ctl <= (en => a_i, mode => '0');
  vec <= (others => a_i);
  y_o <= vec & ctl.en & ctl.mode & "00";
end architecture rtl;
