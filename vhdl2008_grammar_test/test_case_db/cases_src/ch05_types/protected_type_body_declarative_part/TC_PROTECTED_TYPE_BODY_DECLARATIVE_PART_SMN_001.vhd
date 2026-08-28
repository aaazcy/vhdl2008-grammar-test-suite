-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_BODY_DECLARATIVE_PART_SMN_001
-- Related Rule ID: SMN_PROTECTE_001
-- Rule Type: Semantic
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_body_declarative_part ::=
--   { protected_type_body_declarative_item }
-- Test Focus: SEMANTIC NEGATIVE — variable declaration uses
--   unconstrained array type without providing a constraint.
--   All variables in a protected body must have fully
--   constrained subtypes.
-- Case Type: Negative
-- Expected Result: Triggers semantic error — unconstrained variable
-- =============================================================
entity pt_body_dp_smn_unconstrained is
  port (
    clk : in  bit;
    val : out integer
  );
end entity pt_body_dp_smn_unconstrained;

architecture rtl of pt_body_dp_smn_unconstrained is
  type t_pt is protected
    procedure store(d : integer);
    impure function read return integer;
  end protected;
  type t_pt is protected body
    -- ERROR: bit_vector is unconstrained; variable needs constraint
    variable v_buf : bit_vector;
    variable v_data : integer := 0;
    procedure store(d : integer) is begin v_data := d; end procedure;
    impure function read return integer is begin return v_data; end function;
  end protected body;
  shared variable sv : t_pt;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.store(99); val <= sv.read;
    end if;
  end process;
end architecture rtl;
